maintainer       "Filter Squad"
maintainer_email "darcy@filtersquad.com"
license          "Apache 2.0"
description      "Installs pyapns on a given machine"
version          "1.1"

depends "python"

recipe "pyapns", "Installs pyapns using the attributes specified"

%w{redhat centos scientific ubuntu amazon}.each do |os|
  supports os
end