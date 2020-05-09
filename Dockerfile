# Specifies base image and tag
FROM tensorflow/tensorflow:latest-py3

#Meta-Data
LABEL maintainer="Jailson Pereira Januário <jailson@icomp.ufam.edu.br>"


WORKDIR /app

# Downloads training data ou copies examples
COPY ./audio-cats-and-dogs /app/data-cats-and-dogs

# Copies the trainer code to the docker image.
COPY ./classifier /app/classifier

# Installs additional packages
RUN pip install pandas scikit-learn librosa jupyter keras numpy seaborn

#Make port 8888 available to the world outside this container
EXPOSE 8888


#Run jupyter when container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]

