CANDIDATE_QUERY = 'remembered_on < ? and
                   (dropped_on is null or dropped_on >= ?)'

class Remembrance < ActiveRecord::Base
  def self.todays_candidates
    Remembrance.where(CANDIDATE_QUERY, Date.today, Date.today)
               .order(:id)
  end

  def self.todays_prng
    Random.new(Date.today.to_datetime.to_i)
  end

  def self.bite
    candidates = Remembrance.todays_candidates
    random = self.todays_prng
    index = random.rand(candidates.count)
    candidates[index]
  end

  def as_json(options={})
    json = super(only: [:url, :title, :preview])
    json['is_dropped'] = !self.dropped_on.nil?
    json
  end
end
