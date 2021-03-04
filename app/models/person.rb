# frozen_string_literal: true

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :created_at, :updated_at, :last_contacted_at, :last_replied_at, :first_name, :last_name,
                :display_name, :email_address, :full_email_address, :secondary_email_address, :personal_email_address,
                :phone, :phone_extension, :home_phone, :mobile_phone, :linkedin_url, :title, :city, :state,
                :country, :work_city, :work_state, :work_country, :crm_url, :crm_id, :crm_object_type, :owner_crm_id,
                :person_company_name, :person_company_website, :person_company_industry, :do_not_contact, :bouncing,
                :locale, :eu_resident, :personal_website, :twitter_handle, :last_contacted_type, :job_seniority,
                :custom_fields, :tags, :contact_restrictions, :counts, :account, :owner, :last_contacted_by,
                :import, :person_stage, :most_recent_cadence

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    instance_values
  end
end
