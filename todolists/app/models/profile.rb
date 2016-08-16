class Profile < ActiveRecord::Base
	belongs_to :user
	validate :first_or_last, :male_not_sue
	validates_inclusion_of :gender, in: %w( male female )

	def first_or_last
		if (!(last_name || first_name ))
			errors.add(:first_name,  "cannot both be empty")
		end
	end

	def male_not_sue
		if(gender == "male" && first_name == "Sue" )
			errors.add(:first_name,  "can't be Sue if male")
		end
	end

	def self.get_all_profiles(min, max)

			Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(:birth_year)


	end

end
