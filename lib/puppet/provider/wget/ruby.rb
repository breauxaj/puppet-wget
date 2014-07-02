require 'fileutils'

Puppet::Type.type(:wget).provide(:ruby) do
  desc "WGET Support"

  commands :wget => 'wget'

  def create
    if File.directory? @resource[:path]
      (@resource[:source]).each do |c|
        puts "source is " + c
        wget c, '-P', @resource[:path]
      end
    end
  end

  def destroy
    (@resource[:source]).each do |d|
      file = d.split("/").last
      puts "destroy file is " + @resource[:path] + file
      FileUtils.rm_f(@resource[:path] + '/' + file)
    end
  end

  def exists?
    (@resource[:source]).each do |e|
      file = e.split("/").last
      puts "exists file is " + @resource[:path] + '/' + file
      File.exists?(@resource[:path] + '/' + file)
    end
  end

end
