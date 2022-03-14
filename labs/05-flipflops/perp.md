
 | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | rising | 0 | 0 |  |  |
   | rising | 0 | 1 |  |  |
   | rising | 1 | 0 |  |  |
   | rising | 1 | 1 |  |  |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | rising | 0 | 0 | 0 | 0 | No change |
   | rising | 0 | 0 | 1 | 1 | No change |
   | rising | 0 | 1 | 0 | 0 | Reset |
   | rising | 0 | 1 | 1 | 0 | Reset |
   | rising | 1 | 0 | 0 | 1 | Set |
   | rising | 1 | 0 | 1 | 1 | Set |
   | rising | 1 | 1 | 0 | 1 | Toggle |
   | rising | 1 | 1 | 1 | 0 | Toggle |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | rising | 0 | 0 | 0 | No change |
   | rising | 0 | 1 | 1 | Nochange |
   | rising | 1 | 0 | 1 | Invert |
   | rising | 1 | 1 | 0 | Invert |

![big man](https://user-images.githubusercontent.com/99683944/158199185-abd50713-6a69-47d3-b8c2-75409b6b0dfa.png)
