Puppet::Type.newtype(:wget) do
  @doc = "Wget files from remote locations"

  ensurable do
    desc "Use wget to fetch a file. Valid values are: present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:path) do
    desc "Destination"

    validate do |value|
      unless value =~ /\A^\/(?:[0-9a-zA-Z\_\-]\/?)+\z/
        raise ArgumentError , "%s is not a valid file path" % value
      end
    end

    isnamevar

  end

  newparam(:source, :array_matching => :all) do
    desc "List of sources"

  end

end
