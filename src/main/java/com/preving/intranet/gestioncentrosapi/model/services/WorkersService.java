package com.preving.intranet.gestioncentrosapi.model.services;

import com.preving.intranet.gestioncentrosapi.model.domain.workers.Employees;
import com.preving.intranet.gestioncentrosapi.model.domain.workers.WorkersFilter;
import com.preving.security.domain.UsuarioWithRoles;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


import com.preving.intranet.gestioncentrosapi.model.domain.workers.Employees;
import com.preving.intranet.gestioncentrosapi.model.dto.workers.EmployeeProjection;

import java.util.List;

public interface WorkersService {

    //    List all Employees
    List<Employees> getAllEmployees(int workCenterId);


    //    Export Workers
    ResponseEntity<?>  exportWorkers(int workCenterId, WorkersFilter wFilter, HttpServletResponse response, UsuarioWithRoles user);
   //WorkersFilter
    List<Employees> getFilteredEmployees(int workCenterId, WorkersFilter workersFilter);

    List<Employees> findAll();

    Employees findById(Long id);


    //    List all Employees
    List<Employees> getEmployees();
//    List<Employees> findAllByEmpLabHistoryFchSalidaIsNull();
}
