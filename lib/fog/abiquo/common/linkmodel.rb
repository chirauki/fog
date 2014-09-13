module LinkModel
  class LinkModel < Fog::Model
    def initialize(attributes={})
      if not attributes['links'].nil?
        attributes['links'].each do |link|
          rel = "#{link['rel'].gsub(/\//, '_')}_lnk"
          if 'edit'.eql?(link['rel']) or 'self'.eql?(link['rel'])
            rel = 'url'
          end
          attributes[rel] = link

          idrel = "#{link['rel'].gsub(/\//, '_')}_id"
          attributes[idrel] = link['href'].split('/').last
        end
      end
      object = super
      object.enterprise_lnk = service.enterprise if object.respond_to?('enterprise_lnk') and object.enterprise_lnk.nil?
      object
    end

    def merge_attributes(new_attributes = {})
      if not new_attributes['links'].nil?
        new_attributes['links'].each do |link|
          rel = "#{link['rel'].gsub(/\//, '_')}_lnk"
          if 'edit'.eql?(link['rel']) or 'self'.eql?(link['rel'])
            rel = 'url'
          end
          new_attributes[rel] = link
        end
      end
      super
    end 

    def to_json
      att = self.attributes.clone
      links = []
      data = {}

      if att.key?(:url)
        urllnk = att.delete(:url)
        urllnk['rel'] = "edit"
        links << urllnk
      end

      att.keys.each do |opt|
        if opt.to_s.include? "_lnk"
          links << att[opt] unless att[opt].nil?
        else
          data[opt.to_s] = att[opt] unless att[opt].nil?
        end
      end
      data['links'] = links
      Fog::JSON.encode(data)
    end
  end
end