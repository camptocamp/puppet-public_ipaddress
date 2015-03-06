# Public IPaddress module for Puppet

[![Puppet Forge](http://img.shields.io/puppetforge/v/camptocamp/public_ipaddress.svg)](https://forge.puppetlabs.com/camptocamp/public_ipaddress)
[![Build Status](https://travis-ci.org/camptocamp/puppet-public_ipaddress.png?branch=master)](https://travis-ci.org/camptocamp/puppet-public_ipaddress)

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
