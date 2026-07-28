# Webserver Role

The `webserver` role installs and configures an Apache HTTP server, deploys an environment-specific portfolio landing page, and verifies that the resulting web endpoint is responding with the expected content.

The role is designed for the Terraform AWS portfolio project, where Terraform provisions the EC2 infrastructure and generates the Ansible inventory, while Ansible configures the operating system and web-server layer.

## Role Responsibilities

This role performs the following operations:

* Installs the configured Apache package.
* Starts the Apache service.
* Enables Apache to start automatically at boot.
* Deploys a Jinja2-based Apache virtual host configuration.
* Deploys an environment-specific portfolio landing page.
* Reloads Apache when its configuration changes.
* Verifies that the web endpoint returns HTTP status code `200`.
* Confirms that the returned page contains the expected title and environment name.

## Requirements

The target host must meet the following requirements:

* A RHEL-compatible Linux distribution that supports the `dnf` package manager, such as:

  * Red Hat Enterprise Linux
  * Rocky Linux
  * AlmaLinux
  * Amazon Linux 2023
* Python installed on the managed host.
* Ansible privilege escalation access through `become`.
* Network access to the operating system package repositories.
* Port `80` allowed through the AWS security group and the host firewall, when applicable.

The role uses only modules from the `ansible.builtin` collection. No additional Ansible collections or Python packages are required on the control node.

## Role Variables

The following variables are consumed by the role.

| Variable                  | Description                                                           | Example                            |
| ------------------------- | --------------------------------------------------------------------- | ---------------------------------- |
| `webserver_package_name`  | Name of the Apache package installed through `dnf`.                   | `httpd`                            |
| `webserver_service_name`  | Name of the Apache system service.                                    | `httpd`                            |
| `webserver_config_path`   | Destination path for the generated Apache virtual host configuration. | `/etc/httpd/conf.d/portfolio.conf` |
| `webserver_document_root` | Directory where the portfolio landing page is deployed.               | `/var/www/html`                    |
| `webserver_index_file`    | Name of the portfolio landing-page file.                              | `index.html`                       |
| `webserver_verify_url`    | URL used to verify that the deployed web application is responding.   | `http://127.0.0.1`                 |
| `page_title`              | Expected page title and value rendered in the landing-page template.  | `Terraform AWS Ansible Portfolio`  |
| `environment_name`        | Name of the environment being configured and validated.               | `development`                      |

Variables can be defined in the role's `defaults/main.yml`, inventory group variables, host variables, or directly in the playbook.

### Example defaults

```yaml
---
webserver_package_name: httpd
webserver_service_name: httpd
webserver_config_path: /etc/httpd/conf.d/portfolio.conf
webserver_document_root: /var/www/html
webserver_index_file: index.html
webserver_verify_url: http://127.0.0.1
page_title: Terraform AWS Ansible Portfolio
```

Environment-specific values should normally be placed in the corresponding inventory variables.

For example:

```yaml
---
environment_name: development
```

## Templates

The role expects the following Jinja2 templates under `templates/`.

### `portfolio.conf.j2`

Defines the Apache virtual host configuration used by the portfolio website.

Example:

```apache
<VirtualHost *:80>
    ServerName localhost
    DocumentRoot "{{ webserver_document_root }}"

    DirectoryIndex {{ webserver_index_file }}

    <Directory "{{ webserver_document_root }}">
        AllowOverride None
        Require all granted
    </Directory>

    ErrorLog logs/portfolio-error.log
    CustomLog logs/portfolio-access.log combined
</VirtualHost>
```

### `index.html.j2`

Defines the environment-specific landing page deployed by the role.

The rendered page must contain both `page_title` and `environment_name` because the verification tasks assert that these values are present in the HTTP response.

Example:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ page_title }}</title>
</head>
<body>
    <main>
        <h1>{{ page_title }}</h1>
        <p>Environment: {{ environment_name }}</p>
    </main>
</body>
</html>
```

## Handlers

The role expects a handler named `Reload Apache`.

Example `handlers/main.yml`:

```yaml
---
- name: Reload Apache
  ansible.builtin.service:
    name: "{{ webserver_service_name }}"
    state: reloaded
```

The virtual host deployment task notifies this handler only when the generated Apache configuration changes.

Before endpoint verification, the role runs:

```yaml
ansible.builtin.meta: flush_handlers
```

This ensures that any pending Apache configuration reload is completed before Ansible tests the web endpoint.

## Dependencies

This role has no dependencies on other Ansible Galaxy roles.

The required AWS infrastructure, including the EC2 instance, networking, security group, and generated Ansible inventory, is provisioned separately through Terraform.

## Example Playbook

```yaml
---
- name: Configure portfolio web servers
  hosts: web
  become: true

  roles:
    - role: webserver
```

Variables can also be passed directly to the role:

```yaml
---
- name: Configure portfolio web servers
  hosts: web
  become: true

  roles:
    - role: webserver
      vars:
        webserver_package_name: httpd
        webserver_service_name: httpd
        webserver_config_path: /etc/httpd/conf.d/portfolio.conf
        webserver_document_root: /var/www/html
        webserver_index_file: index.html
        webserver_verify_url: http://127.0.0.1
        page_title: Terraform AWS Ansible Portfolio
        environment_name: development
```

## Running the Role

From the `ansible` directory, execute the playbook against the desired inventory.

Development:

```bash
ansible-playbook \
  -i inventories/dev/hosts.ini \
  playbooks/configure_webservers.yml
```

Production:

```bash
ansible-playbook \
  -i inventories/prod/hosts.ini \
  playbooks/configure_webservers.yml
```

The exact inventory and playbook paths may differ depending on the repository structure.

## Verification

The role performs two application-level checks after deployment.

### HTTP status verification

The `ansible.builtin.uri` task confirms that the configured endpoint returns HTTP status code `200`.

```yaml
- name: Verify web application responds successfully
  ansible.builtin.uri:
    url: "{{ webserver_verify_url }}"
    return_content: true
    status_code: 200
  register: web_response
```

### Content verification

The `ansible.builtin.assert` task confirms that the returned HTML contains the expected page title and environment name.

```yaml
- name: Verify expected page content
  ansible.builtin.assert:
    that:
      - "page_title in web_response.content"
      - "environment_name in web_response.content"
    fail_msg: The webpage loaded, but the expected content was not found.
    success_msg: The portfolio page was deployed successfully.
```

These checks verify both service availability and successful environment-specific content deployment.

## Idempotence

The role is designed to be idempotent.

After the first successful execution:

* The Apache package remains installed.
* The Apache service remains enabled and running.
* Templates are modified only when their rendered content changes.
* The Apache reload handler runs only when the virtual host configuration changes.
* Verification tasks continue to validate the deployed endpoint without changing the host.

A subsequent execution should therefore complete without unnecessary configuration changes.

## License

BSD

## Author Information

José Ángel Cantú Hernández
GitHub: `TexMachinna`

Project repository:

`https://github.com/TexMachinna/TerraformPortfolio-AWS`
