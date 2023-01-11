package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class MachineLearningService {
    private class BinTree {
        private int nodeID
        private String questOrAns = null
        private BinTree yesBranch = null
        private BinTree noBranch = null


        def BinTree(int newNodeID, String newQuestAns) {
            nodeID = newNodeID
            questOrAns = newQuestAns
        }
        BinTree rootNode = null

        def getSensors(String boxFilter) {
            if (boxFilter) {
                Sensoren.createCriteria().list {
                    eq('box.id', boxFilter)
                    order('id', 'asc')
                }
            }
        }

        def getData(String boxFilter) {
            if (boxFilter) {
                Metingen.createCriteria().list {
                    eq(sensor.box.id, boxFilter)
                }
            }

        }

        def DecisionTree() {
        }
        //CREATE ROOT NODE
        void createRoot(int newNodeID, String newQuestAns) {
            rootNode = new BinTree(newNodeID, newQuestAns)
            System.out.println("Created root node " + newNodeID)
        }
        //ADD YES NODE
        void addYesNode(int existingNodeID, int newNodeID, String newQuestAns) {
            //If no root node does nothing
            if (rootNode == null) {
                System.out.println("ERROR: geen root node!")
                return
            }

            //search tree

            if (searchTreeAndAddYesNode(rootNode, existingNodeID, newNodeID, newQuestAns)) {
                System.out.println("Added node " + newNodeID +
                        " onto  \" yes\"branch of node " + existingNodeID)
            } else System.out.println("Node " + existingNodeID + " not found")
        }

        //SEARCH TREE AND ADD YES NODE
        private boolean searchTreeAndAddYesNode(BinTree currentNode, int existingNodeID, int newNodeID, String newQuestAns) {
            if (currentNode.nodeID == existingNodeID) {
                // Found node
                if (currentNode.yesBranch == null) currentNode.yesBranch = new BinTree(newNodeID, newQuestAns)
                else {
                    System.out.println("WARNING: vorige node aan het overschrijven " + "(id = " + currentNode.yesBranch.nodeID + ") linked to yes branch of node " + existingNodeID)
                    currentNode.yesBranch = new BinTree(newNodeID, newQuestAns)
                }
                return (true)
            } else {
                //try yes branch if it exists
                if (currentNode.yesBranch != null) {
                    if (searchTreeAndAddYesNode(currentNode.noBranch, existingNodeID, newNodeID, newQuestAns)) {
                        return (true)
                    } else {
                        //try no branch if it exists
                        if (currentNode.noBranch != null) {
                            return (searchTreeAndAddYesNode(currentNode.noBranch, existingNodeID, newNodeID, newQuestAns))
                        } else return (false) //not found here
                    }
                }
                return (false) //not found here
            }
        }
        //ADD NO NODE
        void addNoNode(int existingNodeID, int newNodeID, String newQuestAns) {
            //If no root node do nothing

            if (rootNode == null) {
                System.out.println("ERROR: geen root node!")
                return
            }
            //Search tree
            if (searchTreeAndAddNoNode(rootNode, existingNodeID, newNodeID, newQuestAns)) {
                System.out.println("Added node " + newNodeID + " onto\"no\" branch of node " + existingNodeID)
            } else System.out.println("Node " + existingNodeID + " not found")
        }
        //SEARCH TREE AND ADD NO NODE
        private boolean searchTreeAndAddNoNode(BinTree currentNode, int existingNodeID, int newNodeID, String newQuestAns) {
            if (currentNode.nodeID == existingNodeID) {
                //Found node
                if (currentNode.noBranch == null) currentNode.noBranch = new BinTree(newNodeID, newQuestAns)
                else {
                    System.out.println("WARNING: vorige node aan het overschrijven " + "(id = " + currentNode.noBranch.nodeID + ") linked to yes branch of node " + existingNodeID)
                    currentNode.noBranch = new BinTree(newNodeID, newQuestAns)
                }
                return (true)
            } else {
                //try yes branch if it exists
                if (currentNode.yesBranch != null) {
                    return (searchTreeAndAddNoNode(currentNode.noBranch, existingNodeID, newNodeID, newQuestAns))
                } else return (false);
            }
        }

    }
}
