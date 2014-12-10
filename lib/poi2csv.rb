require 'shellwords'
require "poi2csv/version"

module Poi2csv

  Poi2csvException = Class.new(StandardError)
  SUPPORTED_EXTENSIONS = [:xls, :xlsx]

  def self.to_csv(input_file_path, output_folder_path, separator=nil, formating_convention=nil)
    args = [input_file_path, output_folder_path, separator, formating_convention].reject { |v| v.nil? }
    args = args.map { |v| Shellwords.escape(v) }
    console_message = `java -cp #{classpath} ToCSV #{args * ' '}`
    raise Poi2csvException.new, console_message unless output_file_created?(input_file_path, output_folder_path)
  end
  
  def supports_extension?(extension)
    SUPPORTED_EXTENSIONS.include?(extension)
  end

  def self.classpath
    @_classpath ||= File.expand_path(File.join(File.dirname(__FILE__),'*')) + File::PATH_SEPARATOR + File.expand_path(File.join(File.dirname(__FILE__),'..', 'classes'))
  end

  def self.output_file_created?(input_file_path, output_folder_path)
    output_file = File.join(output_folder_path , File.basename(input_file_path, '.*')) + '.csv'
    File.exists?(output_file)
  end
end
