# Public IPaddress module for Puppet

**Provides a public_ipaddress fact for Facter.**

This module is provided by [Camptocamp](http://www.camptocamp.com/)

It uses several public backends (as fallbacks) to retrieve this information, by order of preference:

* http://ident.me
* http://icanhazip.com
* http://checkip.dyndns.org
* http://ifconfig.me/ip
* cache file

When all backends fail, the cache file is used.

## Usage

This module provides a `public_ipaddress` fact for Facter. In order to deploy this fact, simply add this module to your Puppet module path and make sure `pluginsync` is activated.

## Contributing

Please report bugs and feature request using [GitHub issue
tracker](https://github.com/camptocamp/puppet-public_ipaddress/issues).

For pull requests, it is very much appreciated to check your Puppet manifest
with [puppet-lint](https://github.com/camptocamp/puppet-public_ipaddress/issues) to follow the recommended Puppet style guidelines from the
[Puppet Labs style guide](http://docs.puppetlabs.com/guides/style_guide.html).

## License

Copyright (c) 2013 <mailto:puppet@camptocamp.com> All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

