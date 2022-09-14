class Post                          #родительский класс
    def initialize                  #конструктор
        @created_at = Time.now
        @text = [ ]                 # массив строк записи 
    end

    def self.post_types
        [Memo, Task, Link]
    end

    def self.create(type_index)
        return post_types[type_index].new
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

    def file_path
        # Сохраним в переменной current_path место, откуда запустили программу
        current_path = File.dirname(__FILE__)
        # Получим имя файла из даты создания поста метод strftime формирует строку типа "2014-12-27_12-08-31.txt"
        # набор возможных ключей см. в документации Руби
        file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
        # Обратите внимание, мы добавили в название файла даже секунды (%S) — это обеспечит уникальность имени файла  
        return current_path + "/save/" + file_name
    end
end