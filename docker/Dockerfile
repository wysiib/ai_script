FROM harshjv/texlive-2015
ADD http://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh /
RUN chmod +x /update-tlmgr-latest.sh
RUN /update-tlmgr-latest.sh
RUN tlmgr update --self --all
