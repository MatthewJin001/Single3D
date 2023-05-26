
## Hand-eye Parameter Estimation Based on 3D Observation of A Single Marker
Authors: Gumin Jin, Xingkai Yu, Yuqing Chen, Jianxun Li

![mainFig](https://github.com/MatthewJin001/Single3D/blob/main/pic/visualRepresentation.png)

**_Figure_**: Visual representation of the hand-eye calibration of Single Marker. (a) The eye-in-hand case. (b) The eye-to-hand case.


## How to use
### Dependencies
It works well on MATLAB R2023a. The GPAs themselves do not use any solvers, while comparison algorithms and evaluation need the solvers in Optimization Toolbox.

### Main Instructions
To run the single-marker calibration, call
```
[Rcf,tcf,pcf,Rit,tit,pit,rnticf,rntiit] = Alg(Ri,ti,ppi)
```
where
* ``Ri`` (3x3xn): the rotation matrix of robot pose ,
* ``ti`` (3xn): the translation vector of robot pose ,
* ``ppi`` (3xnxm): the 3D observation of a marker,
* ``Rcf`` (3x3): the rotation matrix of hand-eye parameter of closed-form solution ,
* ``tcf`` (3x1): the translation vector of hand-eye parameter of closed-form solution (unit: mm),
* ``pcf`` (3mx1): the marker positon of closed-form solution, 
* ``rnticf`` (1x1):  the runtime of closed-form solution (unit: seconds),
* ``Rit`` (3x3): the rotation matrix of hand-eye parameter of iterative solution,
* ``tit`` (3x1): the translation vector of hand-eye parameter of iterative solution (unit: mm),
* ``pit`` (3mx1): the marker positon of iterative solution, 
* ``rnticf`` (1x1):  the runtime of closed-form solution of iterative solution (unit: seconds),


### Demos
Demo ``main`` contains the calibration and evaluation of multiple methods. run ``main.m``, the results will be stored in ``result.xlsx``. The calibration and the evaluation results of the normal dataset in the paper are as follows
```
      Method          tx         ty         tz        Rx         Ry        Rz  
    _____________    _______    _______    ______    _______    ______    ______

    {'Tsai'     }    -7.7698     -39.71    60.601    -30.714    26.023    38.065
    {'Park'     }    -7.7004    -39.678    60.612    -30.741    26.032    38.059
    {'Horaud'   }    -7.6994    -39.677    60.612    -30.741    26.031    38.061
    {'Liang'    }    -7.6995    -39.677    60.612    -30.741     26.03    38.061
    {'Li'       }     -9.581    -39.506    56.023    -30.792    25.879    38.002
    {'Shah'     }    -6.4477    -43.536    53.069    -30.794    25.878    38.002
    {'TabbZ1'   }    -7.3139      -42.3    54.278    -30.843    25.946    37.932
    {'TabbZ2'   }    -6.5372    -43.287    54.756    -30.708    25.831     38.12
    {'TabbR'    }    -6.7196    -43.616    51.889    -30.742    25.875    38.036
    {'AliX1'    }    -7.0119    -38.716    60.887    -30.909    25.881    38.196
    {'AliX2'    }    -6.2126    -39.046    61.142    -30.961    25.883    38.157
    {'AliR1'    }    -7.4246     -44.16    52.158    -30.644    25.848     38.07
    {'AliR2'    }    -6.8326    -43.298    51.485     -30.75    25.878    37.983
    {'Zhao'     }    -6.3412    -39.347    57.654    -30.857     25.83    38.081
    {'Wu'       }    -8.9322    -39.555    62.226    -30.741    26.026    38.065
    {'Sarabandi'}    -7.6559    -39.671    60.618     -30.74    25.929    38.148
    {'GPAS'     }    -6.8563    -42.375    52.069    -30.772     25.92     37.97
    {'GPAP'     }    -6.7196    -43.616     51.89    -30.742    25.875    38.036
    {'GPAM'     }    -7.2773    -43.033    51.989    -30.749    25.854    38.015
```
```
       Method          Time        TimeD       Proj      Rec  
    _____________    ________    _________    ______    ______

    {'Tsai'     }      1.7045       1.6613    3.0243     2.723
    {'Park'     }      1.5945       1.5656    3.0215    2.7227
    {'Horaud'   }      1.6124       1.5988    3.0214    2.7223
    {'Liang'    }      1.5536       1.5438    3.0214    2.7223
    {'Li'       }      1.5731       1.5679    2.3647    1.9909
    {'Shah'     }      1.5188       1.5149    1.4898    1.4405
    {'TabbZ1'   }      2.2759       1.5356    1.6917    1.5853
    {'TabbZ2'   }      10.009       1.5189    1.6701    1.5838
    {'TabbR'    }      2.1257       1.4869    1.4113    1.3595
    {'AliX1'    }      3.0857       1.5695    3.3509    3.0197
    {'AliX2'    }      2.6798       1.5229    3.4001    3.1389
    {'AliR1'    }      3.9818       1.5295    1.4353    1.3806
    {'AliR2'    }      2.6223       1.5303    1.4139    1.3612
    {'Zhao'     }      3.3255        1.412    2.7252    2.4904
    {'Wu'       }      1.5477       1.5415    3.4871    3.1516
    {'Sarabandi'}       1.548       1.5413    3.0603    2.7448
    {'GPAS'     }    0.018806    0.0003097    1.4438     1.353
    {'GPAP'     }     0.10938     0.000254    1.4113    1.3595
    {'GPAM'     }    0.048826    0.0004161    1.4275    1.3479
```

## Reference
Jin, G., Yu, X., Chen, Y., Li, J. (2023), General Hand-eye Parameter Estimation based on 3D Measurement of a Single-marker, submitted to IEEE Trans. Instrum. Meas.

## Open Dataset
A synced sequence of 3D camera observation and robot measurement can be downloaded from https://github.com/MatthewJin001/3Ddata.

## Contact
Gumin Jin, Department of Automation, Shanghai Jiao Tong University, Shanghai, jingumin@sjtu.edu.cn
