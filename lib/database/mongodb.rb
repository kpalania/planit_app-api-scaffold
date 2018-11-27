module Database
  module MongoDB

    # Save the object to MongoDB
    def persist object
      if object.save
        $logger.debug "..persisted to MongoDB: \n....#{object.inspect}\n"
      else
        raise Mongoid::Errors::MongoidError, "#{object.class} could not be saved"
      end
    end

    # TODO(krish): Not used currently.
    def persist_to_database object, database
      object.with(session: database).save!
      $logger.debug "..persisted to MongoDB: database: #{database.inspect}\n....#{object.inspect}\n"
    end

    def persist_and_switch object, in_database, to_database
      Mongoid.override_database in_database
      persist object
      Mongoid.override_database to_database
    end

  end
end