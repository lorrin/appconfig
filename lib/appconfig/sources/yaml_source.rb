module AppConfig
  class YamlSource < Source
    def initialize(options = {})
      @filename  = options[:file]
      @namespace = options[:env]
    end
    
    def reload_data!
      yaml_structure = YAML.load(File.open @filename)
      @hash          = @namespace ? yaml_structure[@namespace] : yaml_structure
    end
  end
end
