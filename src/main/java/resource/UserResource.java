package resource;


import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import service.UserService;

import java.util.List;

@RestController
@RequestMapping("/api")
@PreAuthorize("hasRole('ADMIN')")
public class UserResource {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/all", method = RequestMethod.GET)
   public List<User> userList() {
        return userService.findUserList();
    }

//    @RequestMapping(value = "/user/primary/transaction", method = RequestMethod.GET)
//    public List<PrimaryTransaction> getPrimaryTransactionList(@RequestParam("username") String username) {
//        return transactionService.findPrimaryTransactionList(username);
//    }
//
//    @RequestMapping(value = "/user/savings/transaction", method = RequestMethod.GET)
//    public List<SavingsTransaction> getSavingsTransactionList(@RequestParam("username") String username) {
//        return transactionService.findSavingsTransactionList(username);
//    }

    @RequestMapping("/user/{username}/enable")
    public void enableUser(@PathVariable("username") String username) {
        userService.enableUser(username);
    }

    @RequestMapping(value = "/user/group", method = RequestMethod.GET)
    public List<User> GroupUserList(String group){
        return userService.findUserByGroup(group);

    }

    @RequestMapping("/user/{username}/disable")
    public void diableUser(@PathVariable("username") String username) {
        userService.disableUser(username);
    }
}
