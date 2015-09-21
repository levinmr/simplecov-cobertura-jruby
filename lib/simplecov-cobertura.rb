require 'nokogiri'
require 'simplecov'

class SimpleCov::Formatter::CoberturaFormatter
  RESULT_FILE_NAME = 'coverage.xml'
  DTD_URL = 'http://cobertura.sourceforge.net/xml/coverage-04.dtd'

  def format(result)
    xml = result_to_xml result

    result_path = File.join(SimpleCov.coverage_path, RESULT_FILE_NAME)
    File.write(result_path, xml)
    puts "Coverage report generated for #{result.command_name} to #{result_path}"
    xml
  end

  private

  def result_to_xml(result)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.doc.create_internal_subset('coverage', nil, "#{DTD_URL}")
      xml.coverage('line-rate' => (result.covered_percent / 100).round(2).to_s,
                   'branch-rate' => '0',
                   'lines-covered' => result.covered_lines.to_s,
                   'lines-valid' =>
                     (result.covered_lines + result.missed_lines).to_s,
                   'branches-covered' => '0',
                   'branches-valid' => '0',
                   'branch-rate' => '0',
                   'complexity' => '0',
                   'version' => '0',
                   'timestamp' => Time.now.to_i.to_s) do
        xml.sources do
          xml.source do
            SimpleCov.root
          end
        end

        xml.packages do
          xml.package('name' => 'simplecov-cobertura',
                      'line-rate' =>
                        (result.covered_percent / 100).round(2).to_s,
                      'branch-rate' => '0',
                      'complexity' => '0') do
            xml.classes do
              result.files.each do |file|
                filename = file.filename
                path = filename[SimpleCov.root.length + 1..-1]
                xml.class_('name' => File.basename(filename, '.*'),
                           'filename' => path,
                           'line-rate' =>
                             (file.covered_percent / 100).round(2).to_s,
                           'branch-rate' => '0',
                           'complexity' => '0') do
                  xml.methods
                  xml.lines do
                    file.lines.each do |file_line|
                      next unless file_line.covered? || file_line.missed?
                      xml.line('number' => file_line.line_number.to_s,
                               'branch' => 'false',
                               'hits' => file_line.coverage.to_s)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    builder.to_xml
  end
end
