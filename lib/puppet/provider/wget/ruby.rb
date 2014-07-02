require 'fileutils'

Puppet::Type.type(:wget).provide(:ruby) do
  desc "WGET Support"

  commands :wget => 'wget'

  def create
    wget resource[:source], '-P', resource[:name]
  end

  def destroy
    file = resource[:source].split("/").last
    FileUtils.rm_f resource[:name] + '/' + file
  end

  def exists?
    file = resource[:source].split("/").last
    File.exists? resource[:name] + '/' + file
  end
  
end
