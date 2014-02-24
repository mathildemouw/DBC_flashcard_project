module AlertCreator
  DELIMITER = "-|-"
  def self.create(model_instance, type)
    return EditAlert.new(model_instance) if type == :edit
    return CreateAlert.new(model_instance) if type == :create
    Alert.new(model_instance)
  end

  def self.translate(error_message, result)
    return false if error_message.nil?
    error_message.gsub(/-\|-/,"#{result}")
  end

  class Alert
    attr_reader :message
    def initialize model_instance
      @model_instance = model_instance
      @message = "ERRORS"
      build_message
    end

    def build_message
      @model_instance.errors.full_messages.each do |error_message|
        @message << "#{DELIMITER} #{error_message}"
      end
    end
  end


  class CreateAlert < Alert
    def build_message
      @message = "Could not create this note"
      super
    end
  end

  class EditAlert < Alert
    def build_message
      @message = "Could not edit this note"
      super
    end
  end
end

helpers AlertCreator