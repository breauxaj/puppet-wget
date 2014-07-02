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
      puts "source is " + s
      file = s.split("/").last
      FileUtils.rm_f(@resource[:path] + file)
    end
  end

  def exists?
    (@resource[:source]).each do |s|
      puts "source is " + s
      file = s.split("/").last
      File.exists?(@resource[:path] + file)
    end
  end

end
