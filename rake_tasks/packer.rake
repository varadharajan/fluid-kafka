namespace :packer do
    PACKER_IMAGE = "hashicorp/packer:1.1.3"
    PACKER_DIR = "/apps/packer"
    PACKER_RUN="docker run -v $(pwd):#{PACKER_DIR}:ro -e 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}' -e 'AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}' -i -t #{PACKER_IMAGE}"

    desc "Bake Kafka 1.1.0 AMI"
    task :bake_kafka_1_1_0 do
        Dir.chdir "./packer" do
            sh "#{PACKER_RUN} build -var-file #{PACKER_DIR}/vars/kafka_1_1_0.vars #{PACKER_DIR}/kafka_1_1_0.json"
        end
    end
end