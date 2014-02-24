module AlertCreator
  DELIMITER = "-|-"
  def self.create(type, args = {})
    case type
    when :edit then return EditAlert.new(args)
    when :create then return CreateAlert.new(args)
    when :answer then return AnswerAlert.new(args)
    when :login then return LoginAlert.new(args)
    else Alert.new(args)
    end
  end

  def self.translate(error_message, result)
    return false if error_message.nil?
    error_message.gsub(/-\|-/,"#{result}")
  end

  class Alert
    attr_reader :message
    def initialize args
      @model_instance = args[:model_instance]
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

  class AnswerAlert < Alert
    def initialize args
      @message = "The answer is #{args[:result]}!#{DELIMITER} #{args[:question]} -> #{args[:answer]}"
    end
  end

  class LoginAlert < Alert
    def initialize args
      @message = "The info you provided for '#{args[:username]}' is not valid"
    end
  end

end

helpers AlertCreator