require 'fileutils'

Puppet::Type.type(:wget).provide(:ruby) do
  desc "WGET Support"

  commands :wget => 'wget'

  def create
    if File.directory? resource[:name]
      puts resource[:source], resource[:name]
      wget resource[:source], '-P', resource[:name]
    end
  end

  def destroy
    file = resource[:source].split("/").last
    puts resource[:name], file
    FileUtils.rm_f resource[:name] + '/' + file
  end

  def exists?
    file = resource[:source].split("/").last
    puts resource[:name], file
    File.exists? resource[:name] + '/' + file
  end
  
end
