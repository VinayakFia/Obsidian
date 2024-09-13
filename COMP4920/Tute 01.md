**Consequentialism**: The ends justify the means
![[Pasted image 20240913150705.png]]
```csharp
Happiness_yeardeprecation(int n, int age)
{
	sadness = 0;
	foreach (yearleft in range(0, n))
	{
		sadness += sadnessIfDeadEarly[age + yearleft];
	}
	sadness += dyingearlyfamilyfriendimpact[expectedage - n];
}
``` 