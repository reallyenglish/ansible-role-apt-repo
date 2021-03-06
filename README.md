# ansible-role-apt-repo

Add apt keys and apt repositories.

## Debian and PPA

The role, deliverately, does not support adding PPA repositories in Debian.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `apt_repo_to_add` | list of apt repository URLs | `[]` |
| `apt_repo_keys_to_add` | list of apt key URLs | `[]` |
| `apt_repo_enable_apt_transport_https` | install `apt-transport-https` if `True` | `false` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-apt-repo
  vars:
    apt_repo_keys_to_add:
      - https://artifacts.elastic.co/GPG-KEY-elasticsearch
    apt_repo_to_add: "{% if ansible_distribution == 'Debian' %}[ 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' ]{% elif ansible_distribution == 'Ubuntu' %}[ 'deb https://artifacts.elastic.co/packages/5.x/apt stable main', 'ppa:webupd8team/java' ]{% endif %}"
    apt_repo_enable_apt_transport_https: True
```

# License

```
Copyright (c) 2016 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>
