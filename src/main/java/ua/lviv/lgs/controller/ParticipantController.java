package ua.lviv.lgs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ua.lviv.lgs.domain.Participant;
import ua.lviv.lgs.service.ParticipantService;


@Controller
public class ParticipantController {

    @Autowired
    private ParticipantService participantService;

    @RequestMapping({"/",""})
    public String init(HttpServletRequest req) {
        req.setAttribute("participants", participantService.findAllParticipants());
        req.setAttribute("mode", "PARTICIPANT_VIEW");
        return "index";
    }

    @GetMapping("/new")
    public String newParticipant(HttpServletRequest req) {
        req.setAttribute("mode", "PARTICIPANT_CREATE");
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Participant participant, HttpServletRequest req) {
        participantService.save(participant);
        req.setAttribute("participants", participantService.findAllParticipants());
        req.setAttribute("mode", "PARTICIPANT_VIEW");
        return "index";
    }

    @GetMapping("/update")
    public String update(@RequestParam int id, HttpServletRequest req) {
        req.setAttribute("participant", participantService.findOne(id));
        req.setAttribute("mode", "PARTICIPANT_EDIT");
        return "index";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam int id, HttpServletRequest req) {
        participantService.delete(id);
        req.setAttribute("participants", participantService.findAllParticipants());
        req.setAttribute("mode", "PARTICIPANT_VIEW");
        return "index";
    }

}