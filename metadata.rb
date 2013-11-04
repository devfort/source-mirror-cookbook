name              "source-mirror"
maintainer        "Steve Marshall"
maintainer_email  "steve@nascentguruism.com"
license           "Apache 2.0"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1"
depends           "mirror-core"
depends           "git"

recipe "source-mirror", "Clones and hosts all the source repositories we might need on a fort."
