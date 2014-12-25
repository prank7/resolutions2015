class User < ActiveRecord::Base
	has_many :resolutions
	accepts_nested_attributes_for :resolutions, allow_destroy: true, reject_if: :all_blank

	def self.find_with_omniauth(auth)
		find_by(uid: auth['uid'])
	end

	def self.create_with_omniauth(auth)
		create!(uid: auth['uid'],
			email: auth.info['email'],
			image: auth.info['image'],
			name: auth.info['name'],
			gender: auth.extra.raw_info['gender'])
	end
end
