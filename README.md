# chef-pyapns

This recipe simply installs and sets up a default running instance of [pyapns](https://github.com/samuraisam/pyapns/) on
an ubuntu box.

We use upstart in this recipe to manage the application recipe.

## Usage

Simply add the `chef-pyapns` recipe to your application and then add `pyapns` to your runlist or include the recipe.

## Configuration

We expose the following options under `node['pyapns']`:

<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>port</code></td>
    <td>Integer</td>
    <td>7077</td>
    <td>The port pyapns will be listening on.</td>
  </tr>
  <tr>
    <td><code>user</code></td>
    <td>String</td>
    <td>pyapns</td>
    <td>The user to create and run pyapns as.</td>
  </tr>
  <tr>
    <td><code>group</code></td>
    <td>String</td>
    <td>pyapns</td>
    <td>The group to create and run pyapns as.</td>
  </tr>
  <tr>
    <td><code>service_name</code></td>
    <td>String</td>
    <td>pyapns</td>
    <td>The name to generate the upstart service as.</td>
  </tr>
  <tr>
    <td><code>home</code></td>
    <td>String</td>
    <td>/var/lib/pyapns</td>
    <td>The directory to create and use as the home directory for the pyapns user. Also where the application is run from.</td>
  </tr>
</table>

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.
* Once it’s accepted, if you want access to the core repository feel free to ask! Otherwise, you can continue to hack away in your own fork.

Other than that, our guidelines very closely match the GemCutter guidelines [here](http://wiki.github.com/qrush/gemcutter/contribution-guidelines).

(Thanks to [GemCutter](http://wiki.github.com/qrush/gemcutter/) for the contribution guide)

## Copyright

Copyright 2012 Filter Squad.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
