**Molecular Dynamics Simulation**

**PMMA分子構造モデル**
直方体構造を再現した

*環境*
ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-darwin19]

*実行方法*
①
`ruby resist.rb`
の後に、pdbファイルが生成される
②
RasTop等のソフトでpdbファイルを読み込み、挙動を確認

*Parametars*
-$boxMaxX: x軸の最大値
-$boxMaxY: y軸の最大値
-$boxMaxZ: z軸の最大値
-$molecularDist1: 分子間距離
-$trials: 試行回数
-totalMono: 総モノマー数
-degreePoly: 重合数