Puppet::Type.newtype(:wget) do
  @doc = "Wget files from remote locations"

  ensurable
 
  newparam(:path) do
    desc "Destination"

    validate do |value|
      unless value =~ /\A^\/(?:[0-9a-zA-Z\_\-]+\/)+\z/
        raise ArgumentError , "%s is not a valid file path" % value
      end
    end

    isnamevar

  end

  newparam(:source) do
    desc "Source"

  end

end
