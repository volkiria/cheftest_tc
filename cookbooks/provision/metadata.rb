name 'provision'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures provision'
long_description 'Installs/Configures provision'
version '0.1.0'
chef_version '>= 13.0'

depends 'yum-mysql-community', '~> 4.0.1'
depends 'mysql', '~> 8.0'
depends 'jenkins', '~> 7.0.0'
depends 'docker', '~> 4.9.2'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/provision/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/provision'
