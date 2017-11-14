# Configuration to enable GitLab, Mattermost and a Docker registry on a domain
# "example.com" with KolabNow as the e-mail provider. A wildcard certificate for
# "*.example.com" is assumed, but the hostnames can be configured with multiple
# certificates as well.

# See the possible options at
# <https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/files/gitlab-config-template/gitlab.rb.template>.

# If changes are made, reload GitLab with `gitlab-ctl reconfigure'.

external_url 'https://git.example.com'

gitlab_rails['gitlab_shell_ssh_port'] = 2222

gitlab_rails['gitlab_ssh_host'] = 'git.example.com'
gitlab_rails['trusted_proxies'] = ['172.0.0.0/8']

gitlab_rails['gitlab_email_from'] = 'git@example.com'
gitlab_rails['gitlab_email_reply_to'] = 'no-reply@example.com'

gitlab_rails['smtp_address'] = 'smtp.kolabnow.com'
gitlab_rails['smtp_domain'] = 'example.com'
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_password'] = '<snip>' # Provide real password here
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = 'gitlab@example.com'

gitlab_workhorse['listen_addr'] = "0.0.0.0:8001"
gitlab_workhorse['listen_network'] = "tcp"

mattermost_external_url 'https://chat.example.com'

mattermost['email_connection_security'] = 'STARTTLS'
mattermost['email_feedback_email'] = 'chat@example.com'
mattermost['email_feedback_name'] = 'Example Chat'
mattermost['email_send_email_notifications'] = true
mattermost['email_smtp_password'] = '<snip>' # Provide real password here
mattermost['email_smtp_port'] = '587'
mattermost['email_smtp_server'] = 'smtp.kolabnow.com'
mattermost['email_smtp_username'] = 'gitlab@example.com'

mattermost['enable'] = true
mattermost['support_email'] =  'chat@example.com'
mattermost['team_site_name'] = 'Example Chat'

mattermost_nginx['enable'] = true
mattermost_nginx['redirect_http_to_https'] = true
mattermost_nginx['ssl_certificate'] = '/etc/gitlab/ssl/wildcard.crt'
mattermost_nginx['ssl_certificate_key'] = '/etc/gitlab/ssl/wildcard.key'

nginx['redirect_http_to_https'] = true
nginx['ssl_certificate'] = '/etc/gitlab/ssl/wildcard.crt'
nginx['ssl_certificate_key'] = '/etc/gitlab/ssl/wildcard.key'

registry_nginx['ssl_certificate'] = '/etc/gitlab/ssl/wildcard.crt'
registry_nginx['ssl_certificate_key'] = '/etc/gitlab/ssl/wildcard.key'
