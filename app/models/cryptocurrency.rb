class Cryptocurrency
    @@all = []

    def initialize(crypto_hash)
        crypto_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        @@all << self
    end  

    def self.all
        @@all
    end

    def self.find_by_id(id)
        self.all.find{|coin| coin.id == id}
    end

    def self.find_by_name(name)
        self.all.find{|coin| coin.name == name}
    end
end