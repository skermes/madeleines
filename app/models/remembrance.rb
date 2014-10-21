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

  def self.from_linked_item(item)
    r = Remembrance.new
    r.url = item.url
    r.title = item.title
    r.preview = item.preview
    r.remembered_on = Date.today
    r.save
    r
  end

  def drop
    self.dropped_on = Date.today
    self.save
  end

  def pick_up
    self.dropped_on = nil
    self.save
  end

  def as_json(options={})
    json = super(only: [:url, :title, :preview])
    json['is_dropped'] = !self.dropped_on.nil?
    json
  end
end
