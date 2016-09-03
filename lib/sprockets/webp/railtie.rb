# encoding: utf-8

module Sprockets
  module WebP
    class Railtie < (::Rails::VERSION::MAJOR < 4 ? ::Rails::Engine : ::Rails::Railtie)
      initializer :webp do |app|
        Sprockets.register_mime_type 'image/jpeg', '.jpg'
        Sprockets.register_postprocessor 'image/jpeg', :jpeg_webp do |context, data|
          Converter.process(app, context, data)
        end

        Sprockets.register_mime_type 'image/png', '.png'
        Sprockets.register_postprocessor 'image/png', :png_webp do |context, data|
          Converter.process(app, context, data)
        end
      end
    end
  end
end
