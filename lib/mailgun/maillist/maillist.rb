module Mailgun

    class MailList
        def initialize(client = Mailgun::Client.new)
            @client = client
        end


        # Creates a new mailing list.
        def create(address, name, description = "", access_level = "readonly")
            options = {
                address: address,
                name: name,
                description: description,
                access_level: access_level
            }
            @client.post('lists',options).to_h
        end

        # add members
        def add_member(address, name, vars, subscribed=true, upsert=false)
            @client.post("lists/#{address}/members",{
                address: address,
                name: name,
                vars: vars,
                subscribed: subscribed,
                upsert: upsert
            }).to_h
        end
    end

end