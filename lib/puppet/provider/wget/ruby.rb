require 'fileutils'

Puppet::Type.type(:wget).provide(:ruby) do
  desc "WGET Support"

  commands :wget => 'wget'

  def create
    if File.directory? @resource[:path]
      (@resource[:source]).each do |s|
        puts "source is " + s
        wget r, '-P', @resource[:path]
      end
    end
  end

  def destroy
    (@resource[:source]).each do |s|
      file = s.split("/").last
      puts "destroy file is " + file
      FileUtils.rm_f(@resource[:path] + file)
    end
  end

  def exists?
    (@resource[:source]).each do |s|
      file = s.split("/").last
      puts "exists file is " + s
      File.exists?(@resource[:path] + file)
    end
  end

end
