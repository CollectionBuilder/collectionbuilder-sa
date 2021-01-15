# frozen_string_literal: true

#########
#
# CollectionBuilder Page Generator
#
# Jekyll plugin to generate pages from _data/ files.
# Designed to create Item pages from metadata CSV for digital collection sites.
# (c) 2021 CollectionBuilder, evanwill, https://github.com/CollectionBuilder/
# Distributed under the conditions of the MIT license
# 
# Originally inspired by jekyll-datapage_gen, https://github.com/avillafiorita/jekyll-datapage_gen
#
#########

module CollectionBuilderPageGenerator
  class ItemPageGenerator < Jekyll::Generator
    safe true

    # main function to read config, data, and generate pages
    def generate(site)

      # Default settings to use if not configured in _config.yml
      # These are CollectionBuilder specific settings
      data_file_default = site.config['metadata'] || 'metadata' # _data to use
      template_default = 'item' # _layout to use for pages
      name_default = 'objectid' # value to use for filename
      dir_default = 'items' # where to output pages
      extension_default = 'html' # extension, usually html
      filter_default = nil # value to filter records on, off by default
      
      # get optional configuration from _config.yml, or create a single default one from CB metadata setting
      configure_gen = site.config['page_gen'] || [{ 'data' => data_file_default }]
      
      # iterate over each instance in configuration
      # this allows to generate from multiple _data sources
      configure_gen.each do |data_config|
        data_file = data_config['data'] || data_file_default
        template = data_config['template'] || template_default
        name = data_config['name'] || name_default
        dir = data_config['dir'] || dir_default
        extension = data_config['extension'] || extension_default
        filter = data_config['filter'] || filter_default

        # check if layout exists, if not provide error message and skip
        if !site.layouts.key? template
          puts "Error cb_page_gen: Could not find layout '#{template}'. Please check configuration or add the layout. Item pages are NOT being generated from '#{data_file}'!"
          next
        end

        # check if data file exists, if not provide error message and skip
        if !site.data.key? data_file.split('.')[0]
          puts "Error cb_page_gen: Data value '#{data_file}' does not match any site data. Please check _config.yml 'metadata' or page_gen 'data' value. Common issues are spelling error or including an extension such as .csv (no extension should be used!). Item pages are NOT being generated from '#{data_file}'!"
          next
        end

        # Get the records to generate pages from
        # this splits on . to support a nested key in yml or json
        records = nil
        data_file.split('.').each do |level|
          if records.nil?
            records = site.data[level]
          else
            records = records[level]
          end
        end

        # Filter records based on condition
        records = records.select { |r| r[filter] } if filter
        records = records.select { |record| eval(data_config['filter_condition']) } if data_config['filter_condition']

        # Check for unique names, if not provide error message
        names_test = records.map { |x| x[name] }
        if names_test.size != names_test.uniq.size 
          puts "Error cb_page_gen: some values in '#{name}' are not unique! This means those pages will overwrite each other, so you will be missing some Item pages. Please check '#{name}' and make them all unique."
        end

        # Generate pages for each record
        records.each_with_index do |record, index|
          if !record[name]
            puts "Error cb_page_gen: record '#{index}' in '#{data_file}' does not have a value in '#{name}'! This means it won't have a valid filename and will be skipped."
            next
          end
          # provide index number for page object
          record['index_number'] = index 
          # add layout value
          record['layout'] = template
          # pass the page data to the ItemPage generator
          site.pages << ItemPage.new(site, record, name, dir, extension)
        end
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class ItemPage < Jekyll::Page
    # include jekyll utils so can use slugify
    include Jekyll::Utils

    # function to generate each individual page
    def initialize(site, record, name, dir, extension)
      @site = site             # the current site instance.
      @base = site.source      # path to the source directory.
      @dir  = dir         # the directory the page will output in
      
      # clean filename with Jekyll Slugify pretty mode
      # this ensures clean filenames, but may cause unintended issues with links if objectid are not well formed
      filename = slugify(record[name], mode: "pretty").to_s
      @basename = filename     # filename without the extension.
      @ext      = "." + extension.to_s      # the extension.
      @name     = filename + "." + extension.to_s # @basename + @ext.

      # add record data to the page
      # all record data will be available in page object
      @data = record

    end
  end

end
