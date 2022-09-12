class Post                          #родительский класс
    def initialize                  #конструктор
        @created_at = Time.now
        @text = nil
    end


    def read_from_console
        #todo
    end

    def to_strings
        #todo
    end

    def save                    # создание файла
        file = File.new(file_path, "w:UTF-8")

        for item in to_strings do
            file.puts(item)
        end

        file.close
    end

    def file_path       # путь файла и его имя
        current_path = File.dirname(__FILE__)
        file_name = @creared_at.strtime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
        return current_path + "/" + file_name
    end
end