# 7.5. Основы golang

1. 
```
package main
import "fmt"

func main() {
        var metr, foot float32
        fmt.Print("Введите расстояние в метрах:")
        fmt.Scanf("%f", &metr )
        foot = metr / 0.3048
        fmt.Print("\nВ в футах: ")
        fmt.Println(foot)
}
```
```
root@vagrant:/home/vagrant/golang# go run 1.go
Введите расстояние в метрах:11

В в футах: 36.089237
```
2. 
```
package main
import "fmt"

func main() {
        x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
        min := x[0]
        for _, list_el := range x {
                if list_el < min {
                        min = list_el
                }
        }
        fmt.Printf("%v\n",x)
        fmt.Print("\n Наименьшее значение: ")
        fmt.Println(min)
}
```
```
root@vagrant:/home/vagrant/golang# go run 2.go
[48 96 86 68 57 82 63 70 37 34 83 27 19 97 9 17]

 Наименьшее значение: 9
```
3. 
```
package main
import "fmt"

func main() {
    var array []int
    for i := 1; i <= 100; i++ {
        if i%3 == 0 {
                array = append(array, i)
        }
    }
    fmt.Println("В диапазоне от 1 до 100 делятся на 3 без остатка числа: ")
    fmt.Printf("%v\n",array)
}

```
```
root@vagrant:/home/vagrant/golang# go run 3.go
В диапазоне от 1 до 100 делятся на 3 без остатка числа:
[3 6 9 12 15 18 21 24 27 30 33 36 39 42 45 48 51 54 57 60 63 66 69 72 75 78 81 84 87 90 93 96 99]
```
