void api_putstr0(char *a);
void api_end(void);

void HariMain(void)
{
    api_putstr0("hello, world\n");
    api_end();
}