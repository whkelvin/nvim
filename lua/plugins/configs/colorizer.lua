local present, colorizer = pcall(require, "colorizer")

if not present then
  print('colorizer not present')
  return
end

colorizer.setup()
