package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class MachineLearningService {
    private class BinTree {
        private int nodeID;
        private String questOrAns = null;
        private BinTree yesBranch = null;
        private BinTree  noBranch = null;
    }
    public BinTree(int newNodeID, String newQuestAns){
        nodeID = newNodeID;
        questOrAns = newQuestAns;
    }
    BinTree rootNode = null;
    def getSensors(String boxFilter){
        if (boxFilter){
            Sensoren.createCriteria().list{
                eq('box.id', boxFilter)
                order('id', 'asc')
            }
        }
    }

    def getData(String boxFilter){
        if (boxFilter){
            Metingen.createCriteria().list{
                eq(sensor.box.id, boxFilter)
            }
    }

    }
    public DecisionTree(){
    }
    //CREATE ROOT NODE
    public void createRoot(int newNodeID, String newQuestAns){
        rootNode = new BinTree(newNodeID, newQuestAns);
        System.out.println("Created root node "+newNodeID);
    }


}
