# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion2.32/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'sample-cdq'
  app.deployment_target = '7.0'
end

task :"build:simulator" => :"schema:build"