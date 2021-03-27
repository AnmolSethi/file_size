# FileSize

Get human readable file sizes in an easy way

## Examples

- Direct Method Call

| Method                          | Result |
| ------------------------------- | ------ |
| FileSize.getSize(1000)          | "1 KB" |
| FileSize.getSize(1048576)       | "1 MB" |
| FileSize.getSize(1073741824)    | "1 GB" |
| FileSize.getSize(1099511627776) | "1 TB" |

- Method call with precision [Optional]

| Method                             | Result       |
| ---------------------------------- | ------------ |
| FileSize.getSize(664365320, 3)     | "633.588 MB" |
| FileSize.getSize(4324324232343, 4) | "3.9321 TB"  |
