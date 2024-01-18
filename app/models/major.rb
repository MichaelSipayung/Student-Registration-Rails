class Major < ApplicationRecord
  belongs_to :user
  validates :jurusan_1, presence: true, length: { minimum: 4, maximum: 20 }
  validates :jurusan_2, presence: true, length: { minimum: 4, maximum: 20 }
  validates :jurusan_3, presence: true, length: { minimum: 4, maximum: 20 }
  validates :gelombang, presence: true, length: { minimum: 4, maximum: 30 }
  #each jurusan_1 is different from jurusan_2 and jurusan_3
  # each jurusan_2 is different from jurusan_3
  validate :jurusan_1_not_equal_jurusan_2
  validate :jurusan_1_not_equal_jurusan_3
  validate :jurusan_2_not_equal_jurusan_3

  private
    def jurusan_1_not_equal_jurusan_2
      if jurusan_1 == jurusan_2
        errors.add(:jurusan_1, "can't be equal to jurusan_2")
      end
    end
    def jurusan_1_not_equal_jurusan_3
      if jurusan_1 == jurusan_3
        errors.add(:jurusan_1, "can't be equal to jurusan_3")
      end
    end
    def jurusan_2_not_equal_jurusan_3
      if jurusan_2 == jurusan_3
        errors.add(:jurusan_2, "can't be equal to jurusan_3")
      end
    end
end
