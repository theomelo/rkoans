# frozen_string_literal: true

module RailsSupport
  RAILS_FIXTURE = File.expand_path('../fixtures/rails_curriculum', __dir__)
  RAILS_CACHE = File.expand_path('../../tmp/rails-runtime', __dir__)

  private

  # Reuses explicitly prepared test dependencies; tests never install or silently skip Rails.
  def prepared_runtime
    runtime = Rkoans::RailsRuntime.new(directory: RAILS_CACHE)
    raise 'Run the documented Rails test setup before rake.' unless runtime.ready?

    runtime
  end

  # Copies every editable reference file without deriving exercise expectations from it.
  def apply_references(exercise)
    exercise.reference_files.each { |learner, reference| File.write(learner, File.read(reference)) }
  end
end
