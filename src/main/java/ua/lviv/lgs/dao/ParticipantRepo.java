package ua.lviv.lgs.dao;

import org.springframework.stereotype.Repository;
import ua.lviv.lgs.domain.Level;
import ua.lviv.lgs.domain.Participant;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Repository
public class ParticipantRepo {

    private List<Participant> participants = new ArrayList<>();

    @PostConstruct
    public void init() {

        Participant participant = new Participant( "Tom", "Tom@gmail.com",Level.L2,"Magic");
        save(participant);
        Participant participant2 = new Participant("Ron", "Ron@jmail.com", Level.L3, "Power");
        save(participant2);
        Participant participant3 = new Participant("Sam", "Sam@ua.fm", Level.L5, "Smart");
        save(participant3);
        Participant participant4 = new Participant("Sara", "Sarkill@mm.ua", Level.L1, "Pretty");
        save(participant4);
    }

    public List<Participant> findAllParticipants() {

        return participants;
    }

    public Participant findOne(int id) {
        return participants.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }

    public void save(Participant participant) {
//		update

        if (participant.getId() != null) {
            Participant participantToUpdate = findOne(participant.getId());
            int participantIndex = participants.indexOf(participantToUpdate);
            participantToUpdate.setName(participant.getName());;
            participantToUpdate.setEmail(participant.getEmail());
            participantToUpdate.setLevel(participant.getLevel());
            participantToUpdate.setPrimarySkill(participant.getPrimarySkill());

            participants.set(participantIndex, participantToUpdate);
        } else {
//			save
            participant.setId(participants.size()+1);
            participants.add(participant);
        }

    }

    public void delete(int id) {
        Iterator<Participant> iter = participants.iterator();
        while (iter.hasNext()) {
            if (iter.next().getId() == id) {
                iter.remove();
            }
        }
    }

}

