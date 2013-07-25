require "poi2csv/version"

module Poi2csv

  def self.to_csv(input_file_path, output_folder_path, separator=nil, formating_convention=nil) 
  	`java -cp #{classpath} ToCSV #{input_file_path} #{output_folder_path} #{separator} #{formating_convention}`
  end

  def self.classpath
  	@_classpath ||= File.expand_path(File.join(File.dirname(__FILE__),'*')) + File::PATH_SEPARATOR + File.expand_path(File.join(File.dirname(__FILE__),'..', 'classes'))
  end
end
